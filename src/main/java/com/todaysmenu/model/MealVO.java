package com.todaysmenu.model;

public class MealVO {
	
	private String meal_num;
	private String meal_type;
	private String meal_menu;
	private String User_id;
	private String mealed_at;
	
	public String getMeal_num() {
		return meal_num;
	}
	public void setMeal_num(String meal_num) {
		this.meal_num = meal_num;
	}
	public String getMeal_type() {
		return meal_type;
	}
	public void setMeal_type(String meal_type) {
		this.meal_type = meal_type;
	}
	public String getMeal_menu() {
		return meal_menu;
	}
	public void setMeal_menu(String meal_menu) {
		this.meal_menu = meal_menu;
	}
	public String getUser_id() {
		return User_id;
	}
	public void setUser_id(String user_id) {
		User_id = user_id;
	}
	public String getMealed_at() {
		return mealed_at;
	}
	public void setMealed_at(String mealed_at) {
		this.mealed_at = mealed_at;
	}
	
	

}
