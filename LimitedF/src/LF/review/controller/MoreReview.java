package LF.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LF.review.model.vo.Review;

import com.google.gson.Gson;

/**
 * Servlet implementation class MoreReview
 */
@WebServlet("/MoreReview")
public class MoreReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoreReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reId = Integer.valueOf(request.getParameter("reId"));
		int grade = Integer.valueOf(request.getParameter("grade"));
		int sale_Id = Integer.valueOf(request.getParameter("sale_Id"));
		String review_Date = request.getParameter("review_Date");
		String reContent = request.getParameter("reContent");
		
		Review rv = new Review();
		
		rv.setReId(reId);
		rv.setGrade(grade);
		rv.setSale_Id(sale_Id);
		rv.setReview_Date(review_Date);
		rv.setReContent(reContent);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
