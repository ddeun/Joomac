package com.joomac.auth;

import com.joomac.dto.MemberDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor {

    private final String requiredAuth;

    public AuthInterceptor(String requiredAuth) {
        this.requiredAuth = requiredAuth;
    }

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        HttpSession session = request.getSession();
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        // 로그인 체크
        if (loginUser == null) {
            response.sendRedirect("/member/login");
            return false;
        }

        // 권한 체크
        if (!requiredAuth.equals(loginUser.getMauth())) {
            response.sendRedirect("/error/403");
            return false;
        }

        return true;
    }
}