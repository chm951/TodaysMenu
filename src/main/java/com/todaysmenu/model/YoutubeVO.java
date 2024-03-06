package com.todaysmenu.model;

public class YoutubeVO {
	
	private String youtube_num;
	private String youtube_url;
	private String youtube_img;
	private String youtube_title;
	private String youtube_name;
	
	
	public YoutubeVO(String youtube_num, String youtube_url, String youtube_img, String youtube_title,
			String youtube_name) {
		super();
		this.youtube_num = youtube_num;
		this.youtube_url = youtube_url;
		this.youtube_img = youtube_img;
		this.youtube_title = youtube_title;
		this.youtube_name = youtube_name;
	}
	
	
	public String getYoutube_num() {
		return youtube_num;
	}
	public void setYoutube_num(String youtube_num) {
		this.youtube_num = youtube_num;
	}
	public String getYoutube_url() {
		return youtube_url;
	}
	public void setYoutube_url(String youtube_url) {
		this.youtube_url = youtube_url;
	}
	public String getYoutube_img() {
		return youtube_img;
	}
	public void setYoutube_img(String youtube_img) {
		this.youtube_img = youtube_img;
	}
	public String getYoutube_title() {
		return youtube_title;
	}
	public void setYoutube_title(String youtube_title) {
		this.youtube_title = youtube_title;
	}
	public String getYoutube_name() {
		return youtube_name;
	}
	public void setYoutube_name(String youtube_name) {
		this.youtube_name = youtube_name;
	}
	
	
	
	
	
}
