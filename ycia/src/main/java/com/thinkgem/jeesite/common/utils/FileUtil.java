package com.thinkgem.jeesite.common.utils;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

    //自己封装的一个把源文件对象复制成目标文件对象
    public static String uploadImg(MultipartFile mf, String realpath,String path) {
        Date currTime = new Date();
        SimpleDateFormat formatter2 = new SimpleDateFormat("yyyyMMddhhmmssS",
                Locale.US);
        String fileLocal = null;
        if (!mf.isEmpty()) {
            String fileName = null;
            try {
            	String original = mf.getOriginalFilename();
                String subfix = mf.getOriginalFilename().substring(original.lastIndexOf("."),original.length());
                fileName = new String(formatter2.format(currTime).getBytes("utf-8"))+subfix;
                        //+ mf.getOriginalFilename();
            } catch (UnsupportedEncodingException e1) {
                e1.printStackTrace();
            }
            try {
                FileUtils.copyInputStreamToFile(mf.getInputStream(), new File(
                		path + realpath + fileName));
                System.out.println(path);
                fileLocal =realpath+fileName;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return fileLocal;
    }

}
