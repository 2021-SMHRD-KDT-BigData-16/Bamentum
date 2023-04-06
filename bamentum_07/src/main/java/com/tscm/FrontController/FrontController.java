package com.tscm.FrontController;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tscm.controller.BicNumIns;
import com.tscm.controller.CmtCreate;
import com.tscm.controller.CmtDelete;
import com.tscm.controller.Follow;
import com.tscm.controller.JoinService;
import com.tscm.controller.LikeService;
import com.tscm.controller.LogInService;
import com.tscm.controller.LogoutService;
import com.tscm.controller.MorePageService;
import com.tscm.controller.MyProfile;
import com.tscm.controller.PostCreate;
import com.tscm.controller.PostDelete;
import com.tscm.controller.PostFollowing;
import com.tscm.controller.Search;
import com.tscm.controller.SelectPostOne;
import com.tscm.controller.UnFollow;
import com.tscm.model.BmtOnePostDTO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LoggerFactory.getLogger(FrontController.class);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LOG.debug(" {} service - start ", getClass());
		String moveURL = null;

		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		String path = request.getContextPath();

		String strUriDo = uri.substring(path.length() + 1);

		LOG.debug("uri {}, path {}, substr : {}", uri, path, strUriDo);
		if (strUriDo.equals("LogIn.do")) {

			LogInService login = new LogInService();
			moveURL = login.execute(request, response);
			LOG.debug("LogInService moveURL {} ", moveURL);
			response.sendRedirect(moveURL);
			return;

		} else if(strUriDo.equals("onePost.do")) {	
			LOG.debug("**** onePost moveURL {} ", moveURL);
			SelectPostOne selectpostone= new SelectPostOne();		
			moveURL = selectpostone.execute(request, response);
			
			HttpSession session = request.getSession();
			BmtOnePostDTO retDto = (BmtOnePostDTO)session.getAttribute("post");		
						
		} else if (strUriDo.equals("more_page.do")) {

			MorePageService more_page = new MorePageService();
			moveURL = more_page.execute(request, response);
			LOG.debug("MorePageService moveURL {} ", moveURL);
			return;
			
						
		} else if (strUriDo.equals("LikeService.do")) {

			LikeService like = new LikeService();
			moveURL = like.execute(request, response);
			LOG.debug("MorePageService moveURL {} ", moveURL);
						
		}else if (strUriDo.equals("Logout.do")) {

			LOG.debug("LogOutService start ");
			LogoutService logout = new LogoutService();
			moveURL = logout.execute(request, response);
			LOG.debug("LogOutService moveURL {} ", moveURL);

		} else if (strUriDo.equals("Join.do")) {
			
			JoinService join = new JoinService();
			moveURL = join.execute(request, response);
			LOG.debug("JoinService moveURL {} ", moveURL);			
			response.sendRedirect(moveURL);
			return;

		} else if(strUriDo.equals("PostCreate.do")) {
			PostFileUpload(request, response);
			
			
			PostCreate postwrite= new PostCreate();
			moveURL = postwrite.execute(request, response);
			LOG.debug("PostCreate moveURL {} ", moveURL);
			response.sendRedirect(moveURL);
			return;
			
		}else if(strUriDo.equals("PostDelete.do")) {
			PostDelete postdelete= new PostDelete();
			moveURL = postdelete.execute(request, response);
			LOG.debug("PostCreate moveURL {} ", moveURL);
			
		}else if(strUriDo.equals("CmtInput.do")) {
			CmtCreate cmtinput= new CmtCreate();
			moveURL = cmtinput.execute(request, response);
			LOG.debug("cmtService moveURL {} ", moveURL);
			
		} else if(strUriDo.equals("CmtDelete.do")) {
			CmtDelete cmtdelete= new CmtDelete();
			moveURL = cmtdelete.execute(request, response);
			LOG.debug("cmtService moveURL {} ", moveURL);
	// 2023.03.31 경수 추가			
		} else if(strUriDo.equals("BicNumIns.do")) {
			BicNumFileUpload(request, response);

			
			BicNumIns bic_num_ins= new BicNumIns();
			moveURL = bic_num_ins.execute(request, response);
			LOG.debug("BicNumIns moveURL {} ", moveURL);
		} else if(strUriDo.equals("MyProfile.do")) {
			MyProfile my_profile = new MyProfile();
			moveURL = my_profile.execute(request, response);
			LOG.debug("MyProfile moveURL {} ", moveURL);
			
		} else if(strUriDo.equals("Follow.do")) {
			Follow follow = new Follow();
			moveURL = follow.execute(request, response);
			LOG.debug("Follow moveURL {} ", moveURL);
		} else if(strUriDo.equals("UnFollow.do")) {
			UnFollow unfollow = new UnFollow();
			moveURL = unfollow.execute(request, response);
			LOG.debug("UnFollow moveURL {} ", moveURL);
			response.sendRedirect(moveURL);
			return;
		} else if(strUriDo.equals("PostFollowing.do")) {
			PostFollowing post_follow = new PostFollowing();
			moveURL = post_follow.execute(request, response);
			LOG.debug("PostFollowing moveURL {} ", moveURL);
		}else if(strUriDo.equals("Search.do")) {
			Search search = new Search();
			moveURL = search.execute(request, response);
			LOG.debug("cmtService moveURL {} ", moveURL);
			
		}else {
			LOG.debug("FrontController : {}", "Unknown page");
		}

		if(moveURL != null) {
			RequestDispatcher rd =  request.getRequestDispatcher(moveURL);
			rd.forward(request, response);
		}
		
	}
	
	
	private void PostFileUpload(HttpServletRequest request, HttpServletResponse response) {
		
		LOG.debug(" {} service - start ", getClass());
		String moveURL = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			
			PrintWriter out = response.getWriter();
			
//	        String root = request.getSession().getServletContext().getRealPath("/");
//	        String root = "C:/TeamGit/Bamentum_Main/bamentum_07/src/main/webapp/DATA/bic_num_img/bic_num/";
//			String savePath = root + "upload";
			
			String savePath = "C:/TeamGit/Bamentum_Main/bamentum_07/src/main/webapp/DATA/PostImage/";
			String webRoot = "./DATA/PostImage/";
			
	        File f = new File(savePath);
	        if (!f.exists()) {
	            // 폴더가 존재하지 않으면 폴더 생성
	            f.mkdirs();
	        }			
			LOG.debug(" Save Path {}  ", savePath);
			
			int uploadFileSizeLimit = 5 * 1024 * 1024;
			String encType = "UTF-8";
			
			ServletContext context = getServletContext();
//			String uploadFilePath = context.getRealPath(savePath);
			LOG.debug(" Server Real Path {}  ", savePath);
			try {
				MultipartRequest multi = new MultipartRequest(request,
						savePath, uploadFileSizeLimit, encType, 
						new DefaultFileRenamePolicy());
				
				String fileName = multi.getFilesystemName("p_file");
				if (fileName == null) {
					LOG.debug("*** File Upload Fail ***");
				} else {
					
					String p_title = multi.getParameter("p_title");
					String p_content = multi.getParameter("p_content");
					String p_file = webRoot+fileName;

					HttpSession session = request.getSession();
					session.setAttribute("p_title", p_title);
					session.setAttribute("p_content", p_content);
					session.setAttribute("p_file", p_file);
					
					LOG.debug(" PostFileUpload - input - p_title: {}, p_content : {}, p_file: {}", 
							p_title, p_content, p_file);
				}
				
			} catch (Exception e) {
				System.out.print("*** Exception : " + e);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		
		return;
	}
	
	
	
	private void BicNumFileUpload(HttpServletRequest request, HttpServletResponse response) {
		
		LOG.debug(" {} service - start ", getClass());
		String moveURL = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			
			PrintWriter out = response.getWriter();
			
//	        String root = request.getSession().getServletContext().getRealPath("/");
//	        String root = "C:/TeamGit/Bamentum_Main/bamentum_07/src/main/webapp/DATA/bic_num_img/bic_num/";
//			String savePath = root + "upload";
			
			
			
			String savePath = "C:/TeamGit/Bamentum_Main/bamentum_07/src/main/webapp/DATA/bic_num_img/bic_num/";
			String webRoot = "./DATA/bic_num_img/bic_num/";
			
	        File f = new File(savePath);
	        if (!f.exists()) {
	            // 폴더가 존재하지 않으면 폴더 생성
	            f.mkdirs();
	        }			
			LOG.debug(" Save Path {}  ", savePath);
			
			int uploadFileSizeLimit = 5 * 1024 * 1024;
			String encType = "UTF-8";
			
			ServletContext context = getServletContext();
//			String uploadFilePath = context.getRealPath(savePath);
			LOG.debug(" Server Real Path {}  ", savePath);
			try {
				MultipartRequest multi = new MultipartRequest(request,
						savePath, uploadFileSizeLimit, encType, 
						new DefaultFileRenamePolicy());
				
				String fileName = multi.getFilesystemName("b_img");
				if (fileName == null) {
					LOG.debug("*** File Upload Fail ***");
				} else {
					
					String b_brand = multi.getParameter("b_brand");
					String b_model = multi.getParameter("b_model");
					String b_num = multi.getParameter("b_num");
					String b_img = multi.getParameter("b_img");

					HttpSession session = request.getSession();
					session.setAttribute("b_brand", b_brand);
					session.setAttribute("b_model", b_model);
					session.setAttribute("b_num", b_num);
					session.setAttribute("b_img", webRoot+fileName);
					
					LOG.debug(" FileUpload - input2 - b_brand: {}, b_model : {}, b_num: {}, b_img: {}, fileName: {}", 
							b_brand, b_model, b_num, b_img, fileName);
					LOG.debug(" b_img filename {}  ", webRoot+fileName);
				}
				
			} catch (Exception e) {
				System.out.print("예외 발생 : " + e);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		
		return;
	}
	
	
	

}
