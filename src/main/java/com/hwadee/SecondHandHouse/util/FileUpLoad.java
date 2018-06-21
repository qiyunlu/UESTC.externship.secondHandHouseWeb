package com.hwadee.SecondHandHouse.util;

import org.springframework.web.multipart.MultipartFile;  
  
import javax.servlet.http.HttpServletRequest;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;  
import java.util.Date;  
 
public class FileUpLoad {
    //文件上传  
    public static void uploadFile(MultipartFile file, String mappath, String filename , HttpServletRequest request) throws IOException {
        File tempFile = new File(mappath,filename);
        
        if( !file.isEmpty() )
        {
        	try {
                byte[] bytes = file.getBytes();
                if (!tempFile.getParentFile().exists()) {
                    tempFile.getParentFile().mkdirs();
                }
                
                if (!tempFile.exists())
                {
                	tempFile.createNewFile();
                }
                BufferedOutputStream stream = new BufferedOutputStream( new FileOutputStream( tempFile ) );
                
                stream.write(bytes);
                stream.close();
                System.out.print("完毕");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        /*if (!tempFile.getParentFile().exists()) {
            tempFile.getParentFile().mkdirs();
        }  
        if ( !tempFile.exists() )
        {
        	tempFile.createNewFile();
        } 
        file.transferTo(tempFile);*/
    }   
}  
