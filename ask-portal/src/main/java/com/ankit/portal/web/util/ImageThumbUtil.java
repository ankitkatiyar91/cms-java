package com.ankit.portal.web.util;

import static org.imgscalr.Scalr.pad;
import static org.imgscalr.Scalr.resize;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;

import com.ankit.portal.service.domain.ImageFile;
import com.ankit.portal.service.util.ImageFileUtil;

public class ImageThumbUtil {

	public static void main(String[] args) {
		try {
			java.util.List<ImageFile> input=ImageFileUtil.getImageFiles(0, 0);
			for (ImageFile in: input) {
				createThumb(in, in.getDescription());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static BufferedImage createThumbnail(BufferedImage img) {
		// Create quickly, then smooth and brighten it.
		img = resize(img, 200);

		// Let's add a little border before we return result.
		return pad(img, 4);
	}
	private static void cleanImageThumb(ImageFile input) throws IOException{
		InputStream inputStream=new ByteArrayInputStream(input.getContent());
		BufferedImage image=ImageIO.read(inputStream);
		ImageIO.write(image,"png", new File("test.png"));
		File output=new File(input.getDescription());
		System.out.println("Writing image-"+output.getAbsolutePath()+"--"+input.getFileType().substring(input.getFileType().lastIndexOf("/")+1));
		FileOutputStream outputStream=new FileOutputStream(output);
		image=createThumbnail(image);
		ImageIO.write(image,input.getFileType().substring(input.getFileType().lastIndexOf("/")+1), outputStream);
	}
	private static void createThumb(ImageFile input, String name) throws IOException {
		InputStream inputStream=new ByteArrayInputStream(input.getContent());
		BufferedImage img = ImageIO.read(inputStream);
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		BufferedImage thumbnail = Scalr.resize(img, 150);
		thumbnail=Scalr.pad(thumbnail, 1);
		ImageIO.write(thumbnail,name.substring(name.lastIndexOf(".")+1) ,outputStream);
		input.setThumb(outputStream.toByteArray());
		ImageFileUtil.updateImageFile(input);
	}
}
