package com.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/findUserByNameServlet")
public class findUserByNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        response.setContentType("text/html;charset=utf-8");
        UserService service = new UserServiceImpl();
        String name1 = service.findUserByName(name);
        HashMap<String, Object> map = new HashMap<>();
        if(name1!=null){
            map.put("userExist",true);
            map.put("msg","用户名已重复，换一个试试");
        }else {
            map.put("userExist",false);
            map.put("msg","用户名可用");
        }
        //将map转换为json
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),map);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
