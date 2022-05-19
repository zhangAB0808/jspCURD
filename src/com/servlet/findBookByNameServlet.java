package com.servlet;

import com.domain.Book;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findBookByNameServlet")
public class findBookByNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        UserService service = new UserServiceImpl();
        List<Book> books = service.findBookByName(name);
        if (books.size() == 0) {
            request.setAttribute("error", "抱歉,未查询到相关图书信息！");
        } else {
            request.setAttribute("books", books);
        }
        request.getRequestDispatcher("/book.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
