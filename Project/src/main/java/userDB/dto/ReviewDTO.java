package userDB.dto;

import java.time.LocalDateTime;

public class ReviewDTO {
	int review_code;	//리뷰코드
	int user_code;	//유저코드
	int contents_id;	//콘텐츠ID
	String review_text;	//리뷰내용
	String review_image;	//리뷰이미지
	int review_rating;	//평점
	LocalDateTime review_date; //리뷰등록시간
	
	public ReviewDTO() {}
	
	public ReviewDTO(int review_code, int user_code, int contents_id, String review_text, String review_image,
			int review_rating, LocalDateTime review_date) {
		super();
		this.review_code = review_code;
		this.user_code = user_code;
		this.contents_id = contents_id;
		this.review_text = review_text;
		this.review_image = review_image;
		this.review_rating = review_rating;
		this.review_date = review_date;
	}

	public int getReview_code() {
		return review_code;
	}

	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public int getContents_id() {
		return contents_id;
	}

	public void setContents_id(int contents_id) {
		this.contents_id = contents_id;
	}

	public String getReview_text() {
		return review_text;
	}

	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}

	public String getReview_image() {
		return review_image;
	}

	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}

	public int getReview_rating() {
		return review_rating;
	}

	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}

	public LocalDateTime getReview_date() {
		return review_date;
	}

	public void setReview_date(LocalDateTime review_date) {
		this.review_date = review_date;
	}
	
	
}
