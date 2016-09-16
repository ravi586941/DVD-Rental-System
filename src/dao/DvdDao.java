package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.naming.NamingException;

import bean.DvdBean;
import bean.LoginBean;
import bean.RegistrationBean;

public class DvdDao {
	
	
	Connection conn = null;

	public static RegistrationBean newCustomer(RegistrationBean rb) throws ParseException, SQLException, ClassNotFoundException, NamingException {
		// TODO Auto-generated method stub
		
		try {
		System.out.println("Entered Dao");
		Connection myConn = DbConnection.createDatabaseConnection();
		
		System.out.println("UserName is "+rb.getUserName());
		System.out.println("Password is "+rb.getPassword());
		System.out.println("First Name is "+rb.getFirstName());
		System.out.println("Last Name is "+rb.getLastName());
		System.out.println("Gender "+rb.getGender());
		System.out.println("Date Of Birth is "+rb.getDateOfBirth());
		System.out.println("Address is "+rb.getAddress());
		System.out.println("Email Id is "+rb.getEmailId());
		DateFormat outputformatter = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat inputformatter=new SimpleDateFormat("mm/dd/yyyy");
        System.out.println(rb.getDateOfBirth());

        System.out.println(outputformatter.format(inputformatter.parse(rb.getDateOfBirth())));
        System.out.println("queary started");
		PreparedStatement ps= myConn.prepareStatement("insert into registrations values(?,?,?,?,?,?,?,?,?)");
        ps.setInt(1,rb.getUserName());
        ps.setInt(2, rb.getPassword());
        ps.setString(3, rb.getFirstName());
        ps.setString(4, rb.getLastName());
        ps.setString(5, rb.getGender());
        ps.setString(6, rb.getDateOfBirth());
        ps.setString(7, rb.getEmailId());
        ps.setString(8, rb.getAddress());
        ps.setInt(9, 1);
		ps.execute();
		System.out.println("insert queary executed");
		Statement mystmt = myConn.createStatement();
		ResultSet rs = mystmt.executeQuery("select * from registrations where Username='"+rb.getUserName()+"'");
		System.out.println("Entering if loop rb:IN DAO");
		if(rs.next()){
			System.out.println("Entered if loop sb:IN DAO");
			rb.UserName=rs.getInt("UserName");
			rb.Password=rs.getInt("Password");
			rb.FirstName=rs.getString("FirstName");
			rb.LastName=rs.getString("LastName");
			rb.Gender=rs.getString("Gender");
			rb.DateOfBirth=rs.getString("DateOfBirth");
			rb.Address=rs.getString("Address");
			rb.EmailId=rs.getString("EmailId");
			rb.setFlag(1);
		}
		else
		{
			rb.setFlag(0);
		}
	      		} catch (SQLException e) {
		
		e.printStackTrace();
	}


	return rb;

	}

	public static RegistrationBean checkLogin(RegistrationBean rb) throws ClassNotFoundException, SQLException, NamingException {
		// TODO Auto-generated method stub
		Connection myConn = DbConnection.createDatabaseConnection();
		Statement mystmt = myConn.createStatement();
		System.out.println("Trying to check Login with username "+rb.getUserName());
		ResultSet rs = mystmt.executeQuery("select * from registrations where Active='1' and Username='"+rb.getUserName()+"' and Password='"+rb.getPassword()+"'");
		if(rs.next()){
			System.out.println("Successfully Verified Login");
			rb.Password=rs.getInt("Password");
			rb.FirstName=rs.getString("FirstName");
			rb.setFlag(1);
		}
		else{
			rb.setFlag(0);
		System.out.println("Invalid Login");	
		}
		return rb;
	}

	public static DvdBean addDvd(DvdBean db) throws ClassNotFoundException, SQLException, NamingException {
		// TODO Auto-generated method stub
		Connection myConn = DbConnection.createDatabaseConnection();
		System.out.println("queary started");
		PreparedStatement ps= myConn.prepareStatement("insert into dvd values(?,?,?,?,?,?,?,?,?)");
        ps.setInt(1,db.getDvdId());
        ps.setString(2, db.getDvdName());
        ps.setString(3, db.getArtist());
        ps.setInt(4, db.getDuration());
        ps.setString(5, db.getGenre());
        ps.setInt(6, db.getYear());
        ps.setFloat(7, db.getRating());
        ps.setInt(8, db.getQuantity());
        ps.setInt(9, db.getPrice());
        ps.execute();
		System.out.println("insert queary executed");
		Statement mystmt = myConn.createStatement();
		ResultSet rs = mystmt.executeQuery("select * from dvd where DvdId='"+db.getDvdId()+"'");
		if(rs.next()){
			System.out.println("Dvd table has data: DAO");
			db.DvdId=rs.getInt("DvdId");
			db.DvdName=rs.getString("DvdName");
			db.Artist=rs.getString("Artist");
			db.Duration=rs.getInt("Duration");
			db.Genre=rs.getString("Genre");
			db.Year=rs.getInt("Year");
			db.Rating=rs.getFloat("Rating");
			db.Price=rs.getInt("Price");
			db.setFlag(1);
		}
		else
		{
			db.setFlag(0);
		}

		
		return db;
	}

	public static DvdBean searchDvd(DvdBean db) throws ClassNotFoundException, SQLException, NamingException {
		// TODO Auto-generated method stub
		Connection myConn = DbConnection.createDatabaseConnection();
		System.out.println("Searching DVD in DAO");
		Statement mystmt = myConn.createStatement();
		
		if(db.getSelected().equals("name")){
			System.out.println("Quering for name");
		ResultSet rs = mystmt.executeQuery("select * from dvd where DvdName='"+db.getEntered()+"'");
            if(rs.next()){
            	
			    System.out.println("Dvd table has data");
			    db.DvdId=rs.getInt("DvdId");
				db.DvdName=rs.getString("DvdName");
				db.Artist=rs.getString("Artist");
				db.Duration=rs.getInt("Duration");
				db.Genre=rs.getString("Genre");
				db.Year=rs.getInt("Year");
				db.Rating=rs.getFloat("Rating");
				db.Price=rs.getInt("Price");
				db.setFlag(1);			    
		    }
		    else{
		    	db.setFlag(0);
		    }
		}
		if(db.getSelected().equals("artist")){
			System.out.println("quering for artist");
			ResultSet rs = mystmt.executeQuery("select * from dvd where Artist='"+db.getEntered()+"'");	
			if(rs.next()){
				System.out.println("Dvd table has data");
				db.DvdId=rs.getInt("DvdId");
				db.DvdName=rs.getString("DvdName");
				db.Artist=rs.getString("Artist");
				db.Duration=rs.getInt("Duration");
				db.Genre=rs.getString("Genre");
				db.Year=rs.getInt("Year");
				db.Rating=rs.getFloat("Rating");
				db.Price=rs.getInt("Price");
				db.setFlag(1);
		    }
		    else{
		    	db.setFlag(0);
		    }
		}
		if(db.getSelected().equals("year")){
			System.out.println("Quering for year");
			ResultSet rs = mystmt.executeQuery("select * from dvd where Year='"+db.getEntered()+"'");
			if(rs.next()){
				System.out.println("Dvd table has data");
				db.DvdId=rs.getInt("DvdId");
				db.DvdName=rs.getString("DvdName");
				db.Artist=rs.getString("Artist");
				db.Duration=rs.getInt("Duration");
				db.Genre=rs.getString("Genre");
				db.Year=rs.getInt("Year");
				db.Rating=rs.getFloat("Rating");
				db.Price=rs.getInt("Price");
				db.setFlag(1);
		    }
		    else{
		    	db.setFlag(0);
		    }
		}
		
		return db;
	}

	public static DvdBean rentDvd(DvdBean db) throws ClassNotFoundException, SQLException, NamingException {
		// TODO Auto-generated method stub
		Connection myConn = DbConnection.createDatabaseConnection();
		System.out.println("Entered Dao for renting DVD");
		Statement mystmt = myConn.createStatement();
		ResultSet rs = mystmt.executeQuery("select Quantity, DvdName from dvd where DvdId='"+db.getDvdId()+"'");
		if(rs.next()){
			System.out.println("Dvd quantity are zero");
			db.setDvdName(rs.getString("DvdName"));
			if(rs.getInt("Quantity")==0){
				db.setFlag(0);
			}
			else{
				System.out.println("Before updating Dvd quantity "+rs.getInt("Quantity"));
				PreparedStatement ps=myConn.prepareStatement("update dvd set Quantity=? where DvdId=?");
				int temp=(rs.getInt("Quantity")-1);
				System.out.println("Dvd id is "+db.getDvdId());
				System.out.println("Dvd quantity updated as "+temp);
				ps.setInt(1, temp);
				ps.setInt(2, db.getDvdId());
				ps.execute();
				db.setFlag(1);
				db.setRent(db.days*5);
			}
		}
		else
			db.setFlag(2);
		return db;
	}

	public static RegistrationBean viewProfile(RegistrationBean rb) throws ClassNotFoundException, SQLException, NamingException {
		// TODO Auto-generated method stub
		Connection myConn = DbConnection.createDatabaseConnection();
		System.out.println("Entered Dao for viewing customer profile");
		Statement mystmt = myConn.createStatement();
		ResultSet rs = mystmt.executeQuery("select * from registrations where FirstName='"+rb.getFirstName()+"'");
		if(rs.next()){
			rb.UserName=rs.getInt("UserName");
			rb.Password=rs.getInt("Password");
			rb.FirstName=rs.getString("FirstName");
			rb.LastName=rs.getString("LastName");
			rb.Gender=rs.getString("Gender");
			rb.DateOfBirth=rs.getString("DateOfBirth");
			rb.EmailId=rs.getString("EmailId");
			rb.Address=rs.getString("Address");
			rb.setFlag(1);
			
		}
		
		return rb;
	}

	public static RegistrationBean updateProfile(RegistrationBean rb) throws ClassNotFoundException, SQLException, NamingException {
		// TODO Auto-generated method stub
		Connection myConn = DbConnection.createDatabaseConnection();
		System.out.println("Entered Dao for updating customer profile");
		PreparedStatement ps=myConn.prepareStatement("update registrations set Password=?, FirstName=?, LastName=?, Gender=?, DateOfBirth=?, EmailId=?, Address=? where Username=?");
		ps.setInt(1,rb.getPassword());
		ps.setString(2, rb.getFirstName());
		ps.setString(3, rb.getLastName());
		ps.setString(4, rb.getGender());
		ps.setString(5, rb.getDateOfBirth());
		ps.setString(6, rb.getEmailId());
		ps.setString(7, rb.getAddress());
		ps.setInt(8, rb.getUserName());
		ps.execute();
		return rb;
	}

	public static RegistrationBean viewProfileByAdmin(RegistrationBean rb) throws SQLException, ClassNotFoundException, NamingException {
		// TODO Auto-generated method stub
		Connection myConn = DbConnection.createDatabaseConnection();
		System.out.println("Entered Dao for viewing customer profile for admin");
		Statement mystmt = myConn.createStatement();
		ResultSet rs = mystmt.executeQuery("select * from registrations where Username='"+rb.getUserName()+"'");
		if(rs.next()){
			rb.UserName=rs.getInt("UserName");
			rb.Password=rs.getInt("Password");
			rb.FirstName=rs.getString("FirstName");
			rb.LastName=rs.getString("LastName");
			rb.Gender=rs.getString("Gender");
			rb.DateOfBirth=rs.getString("DateOfBirth");
			rb.EmailId=rs.getString("EmailId");
			rb.Address=rs.getString("Address");
			rb.setFlag(1);
		}
		return rb;
	}

	public static RegistrationBean updateProfileByAdmin(RegistrationBean rb) throws ClassNotFoundException, SQLException, NamingException {
		// TODO Auto-generated method stub
		Connection myConn = DbConnection.createDatabaseConnection();
		System.out.println("Entered Dao for updating user profile by admin");
		PreparedStatement ps=myConn.prepareStatement("update registrations set Password=?, FirstName=?, LastName=?, Gender=?, DateOfBirth=?, EmailId=?, Address=? where Username=?");
		ps.setInt(1,rb.getPassword());
		ps.setString(2, rb.getFirstName());
		ps.setString(3, rb.getLastName());
		ps.setString(4, rb.getGender());
		ps.setString(5, rb.getDateOfBirth());
		ps.setString(6, rb.getEmailId());
		ps.setString(7, rb.getAddress());
		ps.setInt(8, rb.getUserName());
		ps.execute();
		return rb;
		
		}

	public static RegistrationBean deleteProfileByAdmin(RegistrationBean rb) throws ClassNotFoundException, SQLException, NamingException {
		// TODO Auto-generated method stub
		Connection myConn = DbConnection.createDatabaseConnection();
		System.out.println("Entered Dao for deleting user profile by admin");
		PreparedStatement ps=myConn.prepareStatement("update registrations set Active=? where Username=?");
		ps.setInt(1,0);
		ps.setInt(2,rb.getUserName());
		ps.execute();
		rb.setFlag(1);
		return rb;
	}

}
