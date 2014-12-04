package br.com.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DataUtil 
{
	public static String toString(Date date, String formato)
	{
		try
		{
			if(formato==null) { formato = "dd/MM/yyyy"; }
			return new SimpleDateFormat(formato).format(date.getTime());
		}
		catch(Exception e) {}
		return "";
	}
	
	public static Date toDate(String data, String formato)
	{
		try
		{
			return new SimpleDateFormat(formato).parse(data);
		}
		catch(Exception e) {}
		return null;
	}
}
