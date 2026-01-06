package com.joomac.config;

import com.joomac.auth.AuthInterceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("main/index");
        registry.addViewController("/error/403").setViewName("error/403");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // USER 이상 (로그인 필요)
        registry.addInterceptor(new AuthInterceptor("USER"))
                .addPathPatterns(
                        "/board/write",
                        "/board/insert",
                        "/cart/**",
                        "/orderpay/**"
                );

        // ADMIN 전용
        registry.addInterceptor(new AuthInterceptor("ADMIN"))
                .addPathPatterns(
                        "/admin/**",
                        "/notice/**"
                );
    }
}