package com.example.stc.service.impl;

import com.example.stc.domain.*;
import com.example.stc.framework.exception.*;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.CookieUtils;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.repository.UserRepository;
import com.example.stc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private PasswordEncoder passwordEncoder; //security提供的加密接口，先写着，等会配置

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DateUtils dateUtils;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Autowired
    private CookieUtils cookieUtils;

    @Resource(name = "authenticationManager")
    private AuthenticationManager authManager;

    @Override
    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public List<User> findUserByRoles(String role) {
        List<User> allUsers = userRepository.findAll();
        allUsers.removeIf(user -> !user.getRoles().contains(role));
        return allUsers;
    }

    @Override
    public void deleteUserById(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new UserNotFoundException(userId));
        userRepository.deleteById(userId);
    }

    @Override
    public void editUser(JSONObject params, User user) {
        Long userId = params.getLong("id");
        User userToEdit = userRepository.findById(userId)
                .orElseThrow(() -> new UserNotFoundException(userId));

        userToEdit.setUsername(user.getUsername());
        userToEdit.setId(user.getId());

        // 用户权限不可更改
        //userToEdit.setRoles(user.getRoles());

        userRepository.save(userToEdit);
    }

    @Override
    public User newUser(User user) {
        //TODO: 这里user.getUsername() 可能会报空指针错误
        if (getUserByUsername(user.getUsername()) != null)
            return null;
        if (user.getUsername() != null && user.getPassword() != null) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setUserID("u" + dateUtils.dateToStr(new Date(), "yyyyMMddHHmmss"));
            user.setEntrusts(null);
            return userRepository.save(user);
        } else { //用户相关信息不完整
            throw new ParamMissingException();
        }
    }

    @Override
    public User findUserByUid(String uid) {
        return userRepository.findByUid(uid);
    }

    @Override
    public int deleteUserByUid(String uid) {
        return userRepository.deleteByUid(uid);
    }

    @Override
    public String userLogin(User user, HttpServletResponse response) {
        UsernamePasswordAuthenticationToken authReq
                = new UsernamePasswordAuthenticationToken(user.getUsername(),
                user.getPassword());
        Authentication auth = authManager.authenticate(authReq);
        SecurityContext sc = SecurityContextHolder.getContext();
        sc.setAuthentication(auth);

        //add cookie
        try {
            cookieUtils.addCookie(response,
                    "roles",
                    authorityUtils.getLoginUser().getRoles(),
                    60 * 60);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "用户登录成功";
    }
}

