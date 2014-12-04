package br.com.utils;

import java.util.ArrayList;
import java.util.List;

import br.com.utils.auxiliar.TipoPessoa;


public class PessoaUtil 
{
	public static String tipoToString(int tipo)
	{
		if(tipo==0) 		{ return "Pessoa Física"; }
		else if(tipo==1) 	{ return "Pessoa Jurídica"; }
		else 				{ return ""; }
	}
	
	public static List<TipoPessoa> getTiposPessoa()
	{
		List<TipoPessoa> tipos = new ArrayList<TipoPessoa>();
		for(int i=0; i<2; i++)
		{
			tipos.add(new TipoPessoa(tipoToString(i), i));
		}
		return tipos;
	}
}
