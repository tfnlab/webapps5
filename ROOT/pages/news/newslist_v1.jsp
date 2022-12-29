<%@ page import="java.io.File" %>
<%@ page import="java.io.FileFilter" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.TreeMap" %>
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
                      // Define the directory where the files are located
                      String directory = "/var/lib/tomcat9/webapps5/ROOT/pages/news/published";
                      Map<String, String> fileMap = new TreeMap<String, String>();
                      Vector<String>  fileList = new Vector<String>();

                      // Create a File object for the directory
                      File dir = new File(directory);

                     
                    %>

                    <ul>
                      <%
                        // Loop through the sorted files array and print the names and creation dates of the files
                        int j = 1;
                        for (File file : files) {
                          fileMap.put((new Date(file.lastModified())).toString(),file.getName());
                          j +=1;
                        }

                    for (String key : fileMap.keySet()) {
                      fileList.add(key);
                    }
                    %>
                    <p>
                      Welcome to the article archive for merikyan.com! On this page, you will find a comprehensive list of all the articles that have been published on our site to date. There are a total of <b><%=fileList.size()%></b> articles in our archive, and they are organized in chronological order, with the most recent articles appearing at the top of the list. This means that you can easily find the latest content published on our site by browsing through the top of the list. Whether you're looking for the latest news, insights, or analysis on a particular topic, or just want to browse through our extensive collection of content, this page is the perfect resource for you. We hope you find what you're looking for, and thank you for visiting merikyan.com!
                    </p>
                    <%
                    for (int i = fileList.size() - 1; i >= 0; i--) {
                      String element = fileList.get(i);
                      %>

                      <div class="card text-center">
                        <div class="card-body">
                          <h5 class="card-title">
                          <a href=published/<%= fileMap.get(element) %> ><%= fileMap.get(element).replace("_", " ").replace(".html", "") %></a>
                          </h5>
                          <p class="card-text">
                          <%=element%>
                          </p>
                        </div>
                        <div class="card-footer">
                          <small class="text-muted">Featured Article <%=i+1%> of <%=fileList.size()%></small>
                        </div>
                        <!--
                        <img src="images/<%= fileMap.get(element) %>.png" class="card-img-right" alt="Card image">
                        -->
                        <HR>
                      </div>

                      <%
                      j +=1;
                    }

                      %>
                    </ul>

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
