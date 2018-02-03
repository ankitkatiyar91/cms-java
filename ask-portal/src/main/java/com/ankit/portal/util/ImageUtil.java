package com.ankit.portal.util;

import static org.imgscalr.Scalr.pad;
import static org.imgscalr.Scalr.resize;

import java.awt.Graphics2D;
import java.awt.Transparency;
import java.awt.color.ColorSpace;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.ComponentColorModel;
import java.awt.image.DataBuffer;
import java.awt.image.DataBufferByte;
import java.awt.image.ImagingOpException;
import java.awt.image.Raster;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;

public class ImageUtil {

	public static BufferedImage resizeImage(final BufferedImage originalImage,
			int IMG_WIDTH, int IMG_HEIGHT,int type) throws IOException {
		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT,
				type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();
		return resizedImage;
	}

	public static int imgType(BufferedImage originalImage) throws IOException {
		int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB
				: originalImage.getType();
		return type;
	}
	
	public static String imgExtension(int type)
	{
	String extension = "";
	if(type == 2)
	extension = "png";
	else if(type == 5)
	extension = "jpg";
	else if(type ==12)
	extension = "gif";
	return extension;
	}
	
	public static BufferedImage createThumbnail(BufferedImage img) {
		// Create quickly, then smooth and brighten it.
		img = resize(img, 200);

		// Let's add a little border before we return result.
		return pad(img, 4);
	}
	
	public static byte[] createThumbnail(File input,String name) {
		try {
			BufferedImage img = ImageIO.read(input);
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			BufferedImage thumbnail = Scalr.resize(img, 150);
			thumbnail=Scalr.pad(thumbnail, 1);
			ImageIO.write(thumbnail,name.substring(name.lastIndexOf(".")+1) ,outputStream);
			return outputStream.toByteArray();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ImagingOpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
}
