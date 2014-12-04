package br.com.model;

import java.util.Date;


public class Proposta
{
	private Integer id;
	private Integer id_cliente;
	private Integer id_funcionario;
	private Date data_venc_proposta;
	private Date data_proposta;
	private Date data_inicio;
	private Date data_fim;
	private double valor;
	private double desconto;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(Integer id_cliente) {
		this.id_cliente = id_cliente;
	}
	public Integer getId_funcionario() {
		return id_funcionario;
	}
	public void setId_funcionario(Integer id_funcionario) {
		this.id_funcionario = id_funcionario;
	}
	public Date getData_venc_proposta() {
		return data_venc_proposta;
	}
	public void setData_venc_proposta(Date data_venc_proposta) {
		this.data_venc_proposta = data_venc_proposta;
	}
	public Date getData_proposta() {
		return data_proposta;
	}
	public void setData_proposta(Date data_proposta) {
		this.data_proposta = data_proposta;
	}
	public Date getData_inicio() {
		return data_inicio;
	}
	public void setData_inicio(Date data_inicio) {
		this.data_inicio = data_inicio;
	}
	public Date getData_fim() {
		return data_fim;
	}
	public void setData_fim(Date data_fim) {
		this.data_fim = data_fim;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public double getDesconto() {
		return desconto;
	}
	public void setDesconto(double desconto) {
		this.desconto = desconto;
	}
}
