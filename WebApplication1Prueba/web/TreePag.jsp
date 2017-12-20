<%-- 
    Document   : TreePag
    Created on : 10-dic-2017, 17:39:30
    Author     : eugeniocano1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/DefauldStyles.css" rel="stylesheet" type="text/css"/>
        <link href="css/tree.css" rel="stylesheet" type="text/css"/>
        
        <script src="js/jquery/jquery.js" type="text/javascript"></script>

        <title>Creador Tree</title>
    </head>
    <body>
        
        <header>
            <h2>DTI Informática</h2>
                <nav id="menu">
                    <ul>
                        <li>
                            <a href="#">Menu</a>
                                <ul>
                                    <li><a href="#">Enlace 2.1</a></li>
                                    <li><a href="#">Enlace 2.2</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </nav>
        </header>
        
        <div class="tree"> 
            <ul> 
                <li>
                    <div> 
                        <img alt="" class="expand" src="Images/res.png" /> 
                        <img alt="" class="collapse" src="Images/sum.png" /> 
                    </div> 
                    
                    <div>Nodo 1 
                    </div> 
                    <ul>  
                        <li> 
                            <div> 
                                <img alt="" class="expand" src="Images/res.png" /> 
                                <img alt="" class="collapse" src="Images/sum.png" /> 
                            </div> 
                            
                            <div>Nodo 1 - 1 
                            </div> 
                            <ul> 
                                <li> 
                                    <div> 
                                        <img alt="" class="expand" src="Images/res.png" /> 
                                        <img alt="" class="collapse" src="Images/sum.png" /> 
                                    </div> 
                                    
                                    <div>Nodo 1 - 1 - 1 
                                    </div> 
                                    <ul> 
                                        <li>
                                            <div> 
                                                <img alt="" class="expand" src="Images/res.png" /> 
                                                <img alt="" class="collapse" src="Images/sum.png" /> 
                                            </div> 
                                            
                                            <div>Nodo 1 - 1 - 1 - 1
                                            </div>
                                            
                                        </li> 
                                        <li>
                                            <div> 
                                                <img alt="" class="expand" src="Images/res.png" /> 
                                                <img alt="" class="collapse" src="Images/sum.png" /> 
                                            </div> 
                                            
                                            <div>Nodo 1 - 1 - 1 - 2 
                                            </div> 
                                        </li> 
                                        <li>
                                            <div> 
                                                <img alt="" class="expand" src="Images/res.png" /> 
                                                <img alt="" class="collapse" src="Images/sum.png" /> 
                                            </div> 
                                            
                                            <div>Nodo 1 - 1 - 1 - 3 
                                            </div> 
                                        </li> 
                                    </ul> 
                                </li> 
                                <li>
                                    <div> 
                                        <img alt="" class="expand" src="Images/res.png" /> 
                                        <img alt="" class="collapse" src="Images/sum.png" /> 
                                    </div>
                                    
                                    <div>Nodo 1 - 1 - 2 
                                    </div>
                                </li>
                                <li>
                                    <div> 
                                        <img alt="" class="expand" src="Images/res.png" /> 
                                        <img alt="" class="collapse" src="Images/sum.png" /> 
                                    </div>
                                    
                                    <div>Nodo 1 - 1 - 3
                                    </div>
                                </li>
                            </ul> 
                        </li> 
                        <li>
                            <div> 
                            <img alt="" class="expand" src="Images/res.png" /> 
                            <img alt="" class="collapse" src="Images/sum.png" /> 
                            </div>
                            
                            <div>Nodo 1 - 2 
                            </div> 
                            <ul> 
                                <li> 
                                    <div> 
                                        <img alt="" class="expand" src="Images/res.png" /> 
                                        <img alt="" class="collapse" src="Images/sum.png" />   
                                    </div>
                                    
                                    <div>Nodo 1 - 2 - 1
                                    </div> 
                                    <ul> 
                                        <li>
                                            <div> 
                                                <img alt="" class="expand" src="Images/res.png" /> 
                                                <img alt="" class="collapse" src="Images/sum.png" /> 
                                            </div>
                                            
                                            <div>Nodo 1 - 2 - 1 - 1
                                            </div> 
                                        </li> 
                                        <li>
                                            <div> 
                                                <img alt="" class="expand" src="Images/res.png" /> 
                                                <img alt="" class="collapse" src="Images/sum.png" /> 
                                            </div>
                                            
                                            <div>Nodo 1 - 2 - 1 - 2 
                                            </div> 
                                        </li> 
                                        <li>
                                            <div> 
                                                <img alt="" class="expand" src="Images/res.png" /> 
                                                <img alt="" class="collapse" src="Images/sum.png" /> 
                                            </div>
                                            
                                            <div>Nodo 1 - 2 - 1 - 3 
                                            </div> 
                                        </li> 
                                    </ul> 
                                </li> 
                                <li> 
                                    <div> 
                                        <img alt="" class="expand" src="Images/res.png" /> 
                                        <img alt="" class="collapse" src="Images/sum.png" /> 
                                    </div>
                                    
                                    <div>Nodo 1 - 2 - 2 
                                    </div> 
                                </li> 
                            </ul> 
                        </li> 
                    </ul> 
                </li>             
            </ul> 
        </div>
        
         <script type="text/javascript" language="javascript"> 
        $(".expand").click(function () { 
            $(this).toggle(); 
            $(this).next().toggle(); 
            $(this).parent().parent().children().last().toggle(); 
        }); 
        $(".collapse").click(function () { 
            $(this).toggle(); 
            $(this).prev().toggle(); 
            $(this).parent().parent().children().last().toggle(); 
        }); 
 
    </script>
        
    </body>
</html>
