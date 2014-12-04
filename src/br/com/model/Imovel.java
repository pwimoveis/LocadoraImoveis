package br.com.model;


public class Imovel
{
	private Integer ID;
	private Integer tipo_imovel;
	private String endereco;
	private String descricao;
	private Integer comodos;
	private Integer id_status;
	
	
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public Integer getTipo_imovel() {
		return tipo_imovel;
	}
	public void setTipo_imovel(Integer tipo_imovel) {
		this.tipo_imovel = tipo_imovel;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public Integer getComodos() {
		return comodos;
	}
	public void setComodos(Integer comodos) {
		this.comodos = comodos;
	}
	public Integer getId_status() {
		return id_status;
	}
	public void setId_status(Integer id_status) {
		this.id_status = id_status;
	}

}
