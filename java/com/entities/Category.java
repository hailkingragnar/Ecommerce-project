package com.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Category {
	@Id
	@Column
     private int categoryID;
	@Column
     private String categoryName;
     @Column(length = 1500)
     private String categoryDescription;
     
     
     
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(String categoryName, String categoryDescription) {
		super();
		
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
     
}
