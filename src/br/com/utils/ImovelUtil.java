package br.com.utils;

import java.util.ArrayList;
import java.util.List;

import br.com.utils.auxiliar.TipoImovel;


public class ImovelUtil 
{
	public static String tipoToString(int tipo)
	{
		if(tipo==0) 		{ return "Casa"; }
		else if(tipo==1) 	{ return "Apartamento"; }
		else if(tipo==2) 	{ return "Ch�cara"; }
		else if(tipo==3) 	{ return "Sal�o"; }
		else 				{ return ""; }
	}
	
	public static List<TipoImovel> getTiposImovel()
	{
		List<TipoImovel> tipos = new ArrayList<TipoImovel>();
		for(int i=0; i<4; i++)
		{
			tipos.add(new TipoImovel(tipoToString(i), i));
		}
		return tipos;
	}
}
