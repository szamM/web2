package com.example.web2;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import web.ResultBean;
import web.Point;
import web.PointCheckRequest;

import java.io.IOException;

@WebServlet("/check")
public class AreaCheckServlet extends HttpServlet {
    private static final Logger logger = LogManager.getLogger(AreaCheckServlet.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PointCheckRequest data = (PointCheckRequest) request.getAttribute("data");
        long startTime = (long) request.getAttribute("startTime");
        logger.info("Received GET request with parameters: x={}, y={}, r={}", data.getX(), data.getY(), data.getR());
        System.out.println(data);
        System.out.print("X:" );
        System.out.println(data.getX());
        System.out.print("Y:" );
        System.out.println(data.getY());
        System.out.print("R:" );
        System.out.println(data.getR());
        boolean result = checkArea(data.getX(), data.getY(), data.getR());
        logger.info("Area check result: {}", result);

        HttpSession session = request.getSession();
        ResultBean resultBean = (ResultBean) session.getAttribute("resultBean");

        if (resultBean == null) {
            logger.info("Creating new ResultBean for session");
            resultBean = new ResultBean();
            session.setAttribute("resultBean", resultBean);
        }
        double x = data.getX(), y = data.getY(), r = data.getR();
        logger.info("Adding result to ResultBean: x={}, y={}, r={}, result={}", x, y, r, result);
        resultBean.add(new Point(x, y, r, result,
                (double)(System.nanoTime() - startTime) / 1000000));

        logger.info("Forwarding to /result.jsp");
        try {
            request.getRequestDispatcher("/result.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean checkArea(double x, double y, double r) {
        boolean rect = x <= 0 && y >= 0 && x >= -r && y <= r;
        boolean circle = x >= 0 && y >= 0 && x*x + y*y <= r*r;
        boolean triangle = x <= 0 && y <= 0 && y >= -x - r/2 && x >= -r/2 && y >= -r/2;
        return rect || circle || triangle;
    }
}