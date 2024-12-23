package web;

import jakarta.servlet.http.HttpServletRequest;

public class PointCheckRequest {
    private final double x;
    private final double y;
    private final double r;

    public static PointCheckRequest of(HttpServletRequest request) throws NullPointerException, IllegalArgumentException {
        double x = Double.parseDouble(request.getParameter("x"));
        double y = Double.parseDouble(request.getParameter("y"));
        double r = Double.parseDouble(request.getParameter("r"));

        if (!validate(x, y, r)) {
            throw new IllegalArgumentException("некорректные данные");
        }

        return new PointCheckRequest(x, y, r);
    }

    private PointCheckRequest(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    private static boolean validate(double x, double y, double r) {
//        System.out.print("X: ");
//        System.out.println(x);
//        System.out.print("Y: ");
//        System.out.println(y);

        return x >= -5 && x <= 3 &&
                y >= -3 && y <= 3 &&
                1 <= r && r <= 5;
    }
}