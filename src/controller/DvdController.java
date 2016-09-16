package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Random;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DvdDao;
import bean.DvdBean;
import bean.LoginBean;
import bean.RegistrationBean;

/**
 * Servlet implementation class DvdController
 */
@WebServlet("/DvdController")
public class DvdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DvdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entered Controller");
		RegistrationBean rb=new RegistrationBean();
		LoginBean lb=new LoginBean();
		DvdBean db=new DvdBean();
		if (request.getParameter("registerform")!=null){
			if(request.getParameter("registerform").equalsIgnoreCase("Submit")){
				Random rand = new Random();
				int uname = rand.nextInt((50000 - 15001) + 1) + 15001;
				int pass = rand.nextInt((50000 - 15001) + 1) + 15001;
				System.out.println("UserName is "+uname);
				System.out.println("Password is "+pass);
				String firstname=request.getParameter("firstname");
				String lastname=request.getParameter("lastname");
				String gender=request.getParameter("gender");
				String dob=request.getParameter("dob");
				String address=request.getParameter("address");
				String emailid=request.getParameter("emailid");
				rb.setUserName(uname);
				rb.setPassword(pass);
				rb.setFirstName(firstname);
				rb.setLastName(lastname);
				rb.setGender(gender);
				rb.setDateOfBirth(dob);
				rb.setAddress(address);
				rb.setEmailId(emailid);
				try {
					System.out.println("Going to Dao");
					RegistrationBean rbb=DvdDao.newCustomer(rb);
					if(rbb.getFlag()==1){
						request.setAttribute("newcustomer", rbb);
						getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			  }
	    	}
		
		
		if (request.getParameter("memberlogin")!=null){
			if(request.getParameter("memberlogin").equalsIgnoreCase("Login")){
				int username=Integer.valueOf(request.getParameter("username"));
				int password=Integer.valueOf(request.getParameter("password"));
				System.out.println("Username is "+username);
				System.out.println("Password is "+password);
				rb.setUserName(username);
				rb.setPassword(password);
						
				
				
				try {
					RegistrationBean rc=DvdDao.checkLogin(rb);
					if(rc.getFlag()==1){
						request.setAttribute("memberoperations", rc);
						System.out.println("Going to Member Functions JSP");
						getServletContext().getRequestDispatcher("/membersuccess.jsp").forward(request, response);
					}
					else{
						getServletContext().getRequestDispatcher("/memberfailure.jsp").forward(request, response);
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			}
		
		
		if (request.getParameter("adminlogin")!=null){
			if(request.getParameter("adminlogin").equalsIgnoreCase("Login")){
				System.out.println("Checking admin login");
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				System.out.println("Username is "+username);
				System.out.println("Password is "+password);
				lb.setUsername(username);
				lb.setPassword(password);
				
				
				if(lb.getUsername().equals("admin") && lb.getPassword().equals("admin")){
					
					System.out.println("Going to Admin Functions JSP");
					request.setAttribute("adminoperations", lb);
					getServletContext().getRequestDispatcher("/adminsuccess.jsp").forward(request, response);
				}
				else{
					System.out.println("Admin Login Failed");
					getServletContext().getRequestDispatcher("/adminfailure.jsp").forward(request, response);
				}
				
			}
			}
		if(request.getParameter("adddvd")!=null){
			if(request.getParameter("adddvd").equalsIgnoreCase("Add DVD")){
				System.out.println("Entered add DVD in controller");
				int DvdId=Integer.parseInt(request.getParameter("dvdid"));
				String DvdName=request.getParameter("dvdname");
				String Artist=request.getParameter("artist");
				int Duration=Integer.parseInt(request.getParameter("duration"));
				String Genre=request.getParameter("genre");
				int Year=Integer.parseInt(request.getParameter("year"));
				float Rating=Float.parseFloat(request.getParameter("rating"));
				int Quantity=Integer.parseInt(request.getParameter("quantity"));
				int Price=Integer.parseInt(request.getParameter("price"));
				System.out.println("DvdId is "+DvdId);
				System.out.println("DvdName is "+DvdName);
				System.out.println("Duration is "+Duration);
				System.out.println("Genre is "+Genre);
				System.out.println("Rating is "+Rating);
				db.setDvdId(DvdId);
				db.setDvdName(DvdName);
				db.setDuration(Duration);
				db.setGenre(Genre);
				db.setRating(Rating);
				db.setArtist(Artist);
				db.setYear(Year);
				db.setQuantity(Quantity);
				db.setPrice(Price);
				
				try {
					DvdBean dbb=DvdDao.addDvd(db);
					if(dbb.getFlag()==1){
						System.out.println("Dvd added. I'm in controller");
						request.setAttribute("dvdadded", dbb);
						getServletContext().getRequestDispatcher("/adddvd.jsp").forward(request, response);
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		if(request.getParameter("search")!=null){
			if(request.getParameter("search").equalsIgnoreCase("Submit")){
				System.out.println("I'm in searching in controller");
				String entered=request.getParameter("entered");
				String selected=request.getParameter("selected");
				System.out.println("Selected is "+selected);
				System.out.println("Entered is "+entered);
				db.setSelected(selected);
				db.setEntered(entered);
				
				try {
					DvdBean dbb=DvdDao.searchDvd(db);
					if(dbb.getFlag()==1){
						System.out.println("Got Dvd details. I'm in controller");
						request.setAttribute("searched", dbb);
						getServletContext().getRequestDispatcher("/searchdvd.jsp").forward(request, response);
					}
					else
						getServletContext().getRequestDispatcher("/searchdvdfailed.jsp").forward(request, response);
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			
		}
		if(request.getParameter("rent")!=null){
			if(request.getParameter("rent").equalsIgnoreCase("Rent Dvd")){
				System.out.println("I'm in renting in controller");
				int dvdId=Integer.parseInt(request.getParameter("dvdid"));
				String fromdate=request.getParameter("fromdate");
				String todate=request.getParameter("todate");
				int onlyfromdate = Integer.parseInt(fromdate.substring(0, Math.min(fromdate.length(), 2)));
				int onlytodate = Integer.parseInt(todate.substring(0, Math.min(todate.length(), 2)));
				int rentdays=onlytodate-onlyfromdate;
				System.out.println("Only from date is "+onlyfromdate);
				System.out.println("Only to date is "+onlytodate);
				System.out.println("Days to be rented "+rentdays);
				db.setDvdId(dvdId);
				db.setDays(rentdays);
				try {
					DvdBean dbb=DvdDao.rentDvd(db);
					
						System.out.println("Dvd rented. I'm in controller");
						request.setAttribute("rented", dbb);
						getServletContext().getRequestDispatcher("/rentdvd.jsp").forward(request, response);
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		if(request.getParameter("viewprofile")!=null){
			if(request.getParameter("viewprofile").equalsIgnoreCase("View Profile")){
				System.out.println("Trying to view profile in controller");
				String firstname=request.getParameter("username");
				System.out.println("Userid trying to view profile is "+firstname);
				rb.setFirstName(firstname);
				try {
					RegistrationBean rbb=DvdDao.viewProfile(rb);
					request.setAttribute("view", rbb);
					getServletContext().getRequestDispatcher("/viewprofile.jsp").forward(request, response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		if(request.getParameter("updateprofile")!=null){
			if(request.getParameter("updateprofile").equalsIgnoreCase("Update Profile")){
				System.out.println("Trying to view data for updating profile in controller");
				String firstname=request.getParameter("username");
				System.out.println("Userid trying to update profile is "+firstname);
				rb.setFirstName(firstname);
				try {
					RegistrationBean rbb=DvdDao.viewProfile(rb);
					request.setAttribute("view", rbb);
					getServletContext().getRequestDispatcher("/updateprofile.jsp").forward(request, response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
		if(request.getParameter("updateform")!=null){
			if(request.getParameter("updateform").equalsIgnoreCase("Update")){
				System.out.println("Trying to update profile in controller");
				int username=Integer.parseInt(request.getParameter("username"));
				int password=Integer.parseInt(request.getParameter("password"));
				String firstname=request.getParameter("firstname");
      			String lastname=request.getParameter("lastname");
				String gender=request.getParameter("gender");
				String dob=request.getParameter("dob");
				String emailid=request.getParameter("emailid");
				String address=request.getParameter("address");
				System.out.println("Userid trying to update profile is "+firstname);
				rb.setUserName(username);
				rb.setPassword(password);
				rb.setFirstName(firstname);
				rb.setLastName(lastname);
				rb.setGender(gender);
				rb.setDateOfBirth(dob);
				rb.setEmailId(emailid);
				rb.setAddress(address);
				try {
					RegistrationBean rbb=DvdDao.updateProfile(rb);
					request.setAttribute("update", rbb);
					getServletContext().getRequestDispatcher("/updateprofile.jsp").forward(request, response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			}
		
		
		if(request.getParameter("viewuser")!=null){
			if(request.getParameter("viewuser").equalsIgnoreCase("View")){
			        System.out.println("Entered DAo: trying to view customer with customerid");
			        int customerid=Integer.parseInt(request.getParameter("custid"));
				    System.out.println("Customer id entered is "+customerid);
				    rb.setUserName(customerid);
				    try {
						RegistrationBean rbb=DvdDao.viewProfileByAdmin(rb);
						request.setAttribute("view", rbb);
						getServletContext().getRequestDispatcher("/viewuser.jsp").forward(request, response);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (NamingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			   }
			 }
		
		
		if(request.getParameter("updateuser")!=null){
			if(request.getParameter("updateuser").equalsIgnoreCase("Update")){
				System.out.println("Trying to view data for updating profile in controller");
				int customerid=Integer.parseInt(request.getParameter("custid"));
				System.out.println("Userid trying to update profile is "+customerid);
				rb.setUserName(customerid);
				try {
					RegistrationBean rbb=DvdDao.viewProfileByAdmin(rb);
					request.setAttribute("view", rbb);
					getServletContext().getRequestDispatcher("/updateuser.jsp").forward(request, response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
		
		if(request.getParameter("userupdateform")!=null){
			if(request.getParameter("userupdateform").equalsIgnoreCase("Update")){
				System.out.println("Trying to update profile in controller");
				int username=Integer.parseInt(request.getParameter("username"));
				int password=Integer.parseInt(request.getParameter("password"));
				String firstname=request.getParameter("firstname");
      			String lastname=request.getParameter("lastname");
				String gender=request.getParameter("gender");
				String dob=request.getParameter("dob");
				String emailid=request.getParameter("emailid");
				String address=request.getParameter("address");
				System.out.println("Userid trying to update profile is "+firstname);
				rb.setUserName(username);
				rb.setPassword(password);
				rb.setFirstName(firstname);
				rb.setLastName(lastname);
				rb.setGender(gender);
				rb.setDateOfBirth(dob);
				rb.setEmailId(emailid);
				rb.setAddress(address);
				try {
					RegistrationBean rbb=DvdDao.updateProfileByAdmin(rb);
					request.setAttribute("update", rbb);
					getServletContext().getRequestDispatcher("/updateuser.jsp").forward(request, response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			}
		
		if(request.getParameter("deleteuser")!=null){
			if(request.getParameter("deleteuser").equalsIgnoreCase("Delete")){
			        System.out.println("Entered DAo: trying to delete customer with customerid");
			        int customerid=Integer.parseInt(request.getParameter("custid"));
				    System.out.println("Customer id entered is "+customerid);
				    rb.setUserName(customerid);
				    try {
						RegistrationBean rbb=DvdDao.deleteProfileByAdmin(rb);
						if(rbb.getFlag()==1){
						request.setAttribute("deleted", rbb);
						getServletContext().getRequestDispatcher("/deleteduser.jsp").forward(request, response);
						}
						else
							getServletContext().getRequestDispatcher("/deleteduser.jsp").forward(request, response);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (NamingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			   }
			 }
		
			}

}
