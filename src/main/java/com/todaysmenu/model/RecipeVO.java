package com.todaysmenu.model;

public class RecipeVO {
	
	private String recipe_num;
	private String recipe_name;
	
	public String getRecipe_num() {
		return recipe_num;
	}
	public void setRecipe_num(String recipe_num) {
		this.recipe_num = recipe_num;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getRecipe_desc() {
		return recipe_desc;
	}
	public void setRecipe_desc(String recipe_desc) {
		this.recipe_desc = recipe_desc;
	}
	public String getRecipe_ingre() {
		return recipe_ingre;
	}
	public void setRecipe_ingre(String recipe_ingre) {
		this.recipe_ingre = recipe_ingre;
	}
	private String recipe_desc;
	private String recipe_ingre;
	
}
