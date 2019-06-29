package com.example.stc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 样本上传托相关接口
 */
@RestController
public class FileUploadController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    /** 上传文件的保存路径 */
    private static String UPLOADED_FOLDER = "files/";

    /** 保存文件 */
    private void saveUploadedFiles(String pid, List<MultipartFile> files) throws IOException {
        // 建立文件夹
        String filepath = UPLOADED_FOLDER + pid + "/";
        File fileDirs = new File(filepath);
        if (!fileDirs.exists()) {
            fileDirs.mkdirs();
        }
        // 保存所有下载的文件
        for (MultipartFile file : files) {
            if (file.isEmpty()) continue;
            byte[] bytes = file.getBytes();
            Path path = Paths.get(filepath + file.getOriginalFilename());
            Files.write(path, bytes);
        }
    }

    /** 文件上传 */
    @PostMapping("/files/{pid}")
    public ResponseEntity<?> uploadFileMulti(@PathVariable String pid, @RequestParam MultipartFile[] files) {

        logger.info("Multiple File Upload");

        String filenames = Arrays.stream(files).map(x -> x.getOriginalFilename())
                .filter(x -> !StringUtils.isEmpty(x)).collect(Collectors.joining(" , "));

        logger.info("Get Upload Filenames: " + filenames);

        if (StringUtils.isEmpty(filenames)) {
            return new ResponseEntity("File Not Found, Please Select a File", HttpStatus.OK);
        }
        try {
            saveUploadedFiles(pid, Arrays.asList(files));
            logger.info("Upload Success");

        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity("Upload Success - " + filenames, HttpStatus.OK);
    }

    /** 文件下载 */
    @GetMapping("/files/{pid}/{filename}")
    public String downloadFile(@PathVariable String pid, @PathVariable String filename,
                               HttpServletRequest request, HttpServletResponse response) {
        // 下载所在源文件
        String filepath = UPLOADED_FOLDER + pid + "/";
        File file = new File(filepath + filename);

        logger.info("File Download From" + filepath + filename);

        if (file.exists()) {
            response.setContentType("application/force-download");// 设置强制下载不打开
            response.addHeader("Content-Disposition", "attachment;filename=" + filename);// 设置文件名
            byte[] buffer = new byte[1024]; // 一次读1KB
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i); // 写入response
                    i = bis.read(buffer);
                }
                try {
                    bis.close();
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                logger.info("Download Success");
                return "Download Success";
            } catch (Exception e) {
                e.printStackTrace();
                return "Download Failed";
            }
        }
        logger.info("Download Failed - File Not Found");
        return "Download Failed - File Not Found";
    }
}
