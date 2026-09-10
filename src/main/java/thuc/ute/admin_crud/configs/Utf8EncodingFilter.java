package thuc.ute.admin_crud.configs;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class Utf8EncodingFilter extends OncePerRequestFilter {

    private static final String UTF_8 = StandardCharsets.UTF_8.name();

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        String adminPath = request.getContextPath() + "/admin/";
        return !request.getRequestURI().startsWith(adminPath);
    }

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException {

        request.setCharacterEncoding(UTF_8);
        response.setCharacterEncoding(UTF_8);
        response.setContentType("text/html;charset=UTF-8");

        HttpServletResponse utf8Response = new HttpServletResponseWrapper(response) {
            @Override
            public void setCharacterEncoding(String charset) {
                super.setCharacterEncoding(UTF_8);
            }

            @Override
            public void setContentType(String contentType) {
                if (contentType != null
                        && contentType.toLowerCase().startsWith("text/html")) {
                    super.setContentType("text/html;charset=UTF-8");
                    return;
                }
                super.setContentType(contentType);
            }
        };

        filterChain.doFilter(request, utf8Response);
    }
}
