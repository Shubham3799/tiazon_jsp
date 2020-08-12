<%@ include file="header.jsp" %>
 <br>
 <div class="content-wrapper">
    <div class="container-fluid">
      
      <!-- Icon Cards-->
      <div class="row">
        
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-warning o-hidden h-100">
        <a href="Admin?page=users" style="color: #fff">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-users"></i>
              </div>
              <div class="mr-5">
                <h2>User Accounts</h2> 
             </div>
            </div>
          </a>
            <a class="card-footer text-white clearfix small z-1" href="Admin?page=users">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-success o-hidden h-100">
        <a href="Admin?page=pushnotif" style="color: #fff">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-bell"></i>
                <span class="badge">100</span>
              </div>	
              <div class="mr-5">
                <h2>Push Notifications</h2>
              </div>
            </div>
          </a>
            <a class="card-footer text-white clearfix small z-1" href="Admin?page=pushnotif">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-danger o-hidden h-100">
     <a href="earnings.php" style="color: #fff">   
		    <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw  fa-area-chart"></i>
              </div>
              <div class="mr-5">
              <h2>Analytics</h2>
            </div>
            </div>
          </a>
            <a class="card-footer text-white clearfix small z-1" href="earnings.jsp">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        
        		
       
      </div>
 
<%@ include file="footer.jsp" %> 

