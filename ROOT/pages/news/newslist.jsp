<%@ page import="java.io.File" %>
<%@ page import="java.io.FileFilter" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Heroic Features - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../../css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-lg-5">
                <a class="navbar-brand" href="https://merikyan.com/">Merikyan</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" href="newslist.jsp">News</a></li>
                        <li class="nav-item"><a class="nav-link" href="../../sponsors.html">Sponsors</a></li>
                        <li class="nav-item"><a class="nav-link" href="../../services.html">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="../../token.html">Rewards</a></li>
                        <li class="nav-item"><a class="nav-link" href="../../ens.html">ENS</a></li>
                        <li class="nav-item"><a class="nav-link" href="https://www.google.com/search?q=site:merikyan.com">Search</a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Content-->
        <section class="pt-4">
            <div class="container px-lg-5">
                <!-- Page Features-->
                <div class="row gx-lg-5">

                <%
                  int pageNum = 1;
                  String pageNumStr = request.getParameter("page");
                  if (pageNumStr != null) {
                    pageNum = Integer.parseInt(pageNumStr);
                  }
                  // Get the list of files in the directory
                  File directory = new File("/var/lib/tomcat9/webapps5/ROOT/pages/news/published");
                  File[] files = directory.listFiles();

                  // Sort the files in ascending order
                  //Arrays.sort(filestmp);
                  // Sort the files in descending order



                  Arrays.sort(files, new Comparator<File>() {
                    @Override
                    public int compare(File f1, File f2) {
                      return -Long.compare(f1.lastModified(), f2.lastModified());
                    }
                  });
                  %>

                  <p>
                    Welcome to the article archive for merikyan.com! On this page, you will find a comprehensive list of all the articles that have been published on our site to date. There are a total of <b><%=files.length%></b> articles in our archive, and they are organized in chronological order, with the most recent articles appearing at the top of the list. This means that you can easily find the latest content published on our site by browsing through the top of the list. Whether you're looking for the latest news, insights, or analysis on a particular topic, or just want to browse through our extensive collection of content, this page is the perfect resource for you. We hope you find what you're looking for, and thank you for visiting merikyan.com!
                  </p>
                  <%
                  // Iterate through the files and print their names
                  int k = 1;
                  int pageSize = 100;
                  int startIndex = (pageNum - 1) * pageSize;
                  int endIndex = Math.min(startIndex + pageSize, files.length);
                  List<File> newspage = Arrays.asList(files).subList(startIndex, endIndex);
%>
<div class="pagination-container d-flex justify-content-center">
  <nav aria-label="Page navigation example">
    <ul class="pagination">
      <%
      // Calculate the total number of pages
      int numPages = (int) Math.ceil((double) files.length / pageSize);

      // Generate a link to the previous page, if applicable
      if (pageNum > 1) {
        %>
        <li class="page-item">
          <a class="page-link" href="newslist.jsp?page=<%= pageNum - 1 %>" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <%
      }

      // Generate links to the individual pages
      for (int i = 1; i <= numPages; i++) {
        %>
        <li class="page-item<%= i == pageNum ? " active" : "" %>">
          <a class="page-link" href="newslist.jsp?page=<%= i %>"><%= i %></a>
        </li>
        <%
      }

      // Generate a link to the next page, if applicable
      if (pageNum < numPages) {
        %>
        <li class="page-item">
          <a class="page-link" href="newslist.jsp?page=<%= pageNum + 1 %>" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
        <%
        }
        %>
        </ul>
        </nav>
        </div>
<%
                  for (File file : newspage) {
                    %>
                    <div class="card text-center">
                      <div class="card-body">
                        <h5 class="card-title">
                        <a href="published/<%= file.getName() %>"" ><%= file.getName().replace("_", " ").replace(".html", "") %></a>
                        </h5>
                        <p class="card-text">
                        <%=file.getName()%>
                        </p>
                      </div>
                      <div class="card-footer">
                        <small class="text-muted">Featured Article <%=k%> of <%=files.length%></small>
                      </div>
                      <img src="images/<%= file.getName() %>.png" class="card-img-right" alt="Card image">
                      <HR>
                    </div>

                    <%
                    k += 1;
                  }
                %>

                <div class="pagination-container d-flex justify-content-center">
                  <nav aria-label="Page navigation example">
                    <ul class="pagination">
                      <%
                      // Calculate the total number of pages
                      // int numPages = (int) Math.ceil((double) files.length / pageSize);

                      // Generate a link to the previous page, if applicable
                      if (pageNum > 1) {
                        %>
                        <li class="page-item">
                          <a class="page-link" href="newslist.jsp?page=<%= pageNum - 1 %>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                          </a>
                        </li>
                        <%
                      }

                      // Generate links to the individual pages
                      for (int i = 1; i <= numPages; i++) {
                        %>
                        <li class="page-item<%= i == pageNum ? " active" : "" %>">
                          <a class="page-link" href="newslist.jsp?page=<%= i %>"><%= i %></a>
                        </li>
                        <%
                      }

                      // Generate a link to the next page, if applicable
                      if (pageNum < numPages) {
                        %>
                        <li class="page-item">
                          <a class="page-link" href="newslist.jsp?page=<%= pageNum + 1 %>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                          </a>
                        </li>
                        <%
                        }
                        %>
                        </ul>
                        </nav>
                        </div>

                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Merikyan 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../../js/scripts.js"></script>
        <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-B5RL5J6S63"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-B5RL5J6S63');
</script>
    </body>
</html>
