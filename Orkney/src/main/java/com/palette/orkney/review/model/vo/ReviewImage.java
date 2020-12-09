package com.palette.orkney.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewImage {
	private int reivew_image_no;
	private int review_no;
	private String originalFileName;
	private String renamedFileName;
}
