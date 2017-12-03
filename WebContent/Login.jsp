<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>

<% String title = "Login"; %>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="<%= title %>"/>
</jsp:include>

	    <main class="container">
	       	<form class="form-horizontal" method="POST" action="loginController.jsp">
	            <div class="row">
	                <div class="col-md-3"></div>
	                <div class="col-md-6">
	                    <h2>Login</h2>
	                    <hr>
	                </div>
	            </div>
	            <% Map<String, String> errors = (Map<String, String>) session.getAttribute("errors");
	            session.removeAttribute("errors");
				if (errors != null) {
					String error = (String) errors.get("invalid");
					if (error != null) { %>
						<div class="row">
	               			<div class="col-md-3"></div>
	                		<div class="col-md-6">
								<div class="alert alert-danger">
								  	<%= error %>
								</div>
							</div>
	            		</div><%
					}
				} %>
	            <div class="row">
	                <div class="col-md-3"></div>
	                <div class="col-md-6">
	                    <div class="form-group has-danger">
	                        <label for="login">Login</label>
	                        <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                            <input type="text" name="login" class="form-control" id="login" placeholder="Login" autofocus>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-3 error">
                        <span class="text-danger align-middle">
                            <% if (errors != null) {
								String error = (String) errors.get("login");
								if (error != null) { %>
									<%= error %><%
								}
							} %>
                        </span>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-md-3"></div>
	                <div class="col-md-6">
	                    <div class="form-group">
	                        <label for="password">Password</label>
	                        <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                            <input type="password" name="password" class="form-control" id="password" placeholder="Password">
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-3 error">
                        <span class="text-danger align-middle">
                            <% if (errors != null) {
								String error = (String) errors.get("password");
								if (error != null) { %>
									<%= error %><%
								}
							} %>
                        </span>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-md-3"></div>
	                <div class="col-md-6">
	                    <button type="submit" class="btn btn-success col-md-12">Login</button>
	                </div>
	            </div>
	        </form>
	    </main><!-- /.container -->

<jsp:include flush="true" page="/footer.jsp"></jsp:include>