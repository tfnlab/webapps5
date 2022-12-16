<%@ page import="java.io.File" %>
<%@ page import="java.io.FileFilter" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Date" %>
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
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-lg-5">
                <a class="navbar-brand" href="#!">Merikyan</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">News</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="py-5">
            <div class="container px-lg-5">
                <div class="p-4 p-lg-5 bg-light rounded-3 text-center">
                    <div class="m-4 m-lg-5">
                        <h1 class="display-5 fw-bold">Glad you're here!</h1>
                        <p class="fs-4">
                          Welcome to our site! We're so glad you're here. Whether you're a returning visitor or a newcomer, we hope you'll find something of interest on our site. Please feel free to explore and reach out to us with any questions or comments. We look forward to connecting with you!
                        </p>
                        <a class="btn btn-primary btn-lg" href="#!">News</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- Page Content-->
        <section class="pt-4">
            <div class="container px-lg-5">
                <!-- Page Features-->
                <div class="row gx-lg-5">



                    <%
                      // Define the directory where the files are located
                      String directory = "/var/lib/tomcat9/webapps5/ROOT/pages/news/published";

                      // Create a File object for the directory
                      File dir = new File(directory);

                      // Use the listFiles method to get an array of File objects for the files in the directory
                      File[] files = dir.listFiles(new FileFilter() {
                        @Override
                        public boolean accept(File pathname) {
                          // Accept only files (not directories)
                          return pathname.isFile();
                        }
                      });

                      // Sort the files array by the date the files were created
                      Arrays.sort(files, new Comparator<File>() {
                        @Override
                        public int compare(File file1, File file2) {
                          // Compare the creation dates of the two files
                          return Long.compare(file1.lastModified(), file2.lastModified());
                        }
                      });
                    %>

                    <ul>
                      <%
                        // Loop through the sorted files array and print the names and creation dates of the files
                        int j = 1;
                        for (File file : files) {

                      %>
                      <li><%=j+""%> <a href=published/<%= file.getName() %> ><%= file.getName().replace("_", " ").replace(".html", "") %></a>
                          <BR>
                          <% j +=1;%>
                          <hr style="border-color: lightblue;">
                          <%= new Date(file.lastModified()) %>
                          <hr style="border-color: black;">
                          <BR><BR>
                       </li>
                      <%
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
        <script src="js/scripts.js"></script>
    </body>
</html>
