package com.example.stc.controller;

import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@RestController
public class UserController {

    @Autowired
    private UserService userService;
    @Resource(name = "authenticationManager")
    private AuthenticationManager authManager;

    /**
     * DEBUG: 注册界面
     */
    @GetMapping("/api/register")
    public String showRegister() {


        return "DEBUG: 用户注册，请Post";
    }

    /**
     * DEBUG: 登录界面
     */
    @GetMapping("/api/login")
    public String showLogin(HttpServletRequest req) {
        UsernamePasswordAuthenticationToken authReq
                = new UsernamePasswordAuthenticationToken("CUSA", "cusa");
        Authentication auth = authManager.authenticate(authReq);

        SecurityContext sc = SecurityContextHolder.getContext();
        sc.setAuthentication(auth);
        HttpSession session = req.getSession(true);
        session.setAttribute(SPRING_SECURITY_CONTEXT_KEY, sc);
        return "DEBUG: 用户登录";
    }

    /**
     * 客户注册
     */
    @PostMapping("/api/register/customer")
    public @ResponseBody
    User registerCustomer(@RequestBody User user) {
        user.addRole(Role.Customer.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 市场部工作人员注册
     */
    @PostMapping("/api/register/salesStaff")
    public @ResponseBody
    User registerSalesStaff(@RequestBody User user) {
        user.addRole(Role.SalesStaff.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 市场部经理注册
     */
    @PostMapping("/api/register/salesManager")
    public @ResponseBody
    User registerSalesManager(@RequestBody User user) {
        user.addRole(Role.SalesManager.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 测试部工作人员注册
     */
    @PostMapping("/api/register/testStaff")
    public @ResponseBody
    User registerTestStaff(@RequestBody User user) {
        user.addRole(Role.TestStaff.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 测试部经理注册
     */
    @PostMapping("/api/register/testManager")
    public @ResponseBody
    User registerTestManager(@RequestBody User user) {
        user.addRole(Role.TestManager.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 质量部经理注册
     */
    @PostMapping("/api/register/qualityManager")
    public @ResponseBody
    User registerQualityManager(@RequestBody User user) {
        user.addRole(Role.QualityManager.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 超级管理员注册
     */
    @PostMapping("/api/register/admin")
    public @ResponseBody
    User registerAdmin(@RequestBody User user) {
        user.addRole(Role.Admin.str());
        userService.newUser(user);
        return user;
    }

}
