package com.todaysmenu.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class BoardVO {
	
	private int b_idx;
	private int b_num;
	private String b_title;
	private String b_content;
	private String created_at;
	private String user_id;
	
	
}
