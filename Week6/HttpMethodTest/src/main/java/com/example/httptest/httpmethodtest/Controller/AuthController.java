package com.example.httptest.httpmethodtest.Controller;

import com.example.httptest.httpmethodtest.DTO.TokenResponse;
import com.example.httptest.httpmethodtest.Service.TokenService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/auth")
public class AuthController {
    private final TokenService tokenService;

    public AuthController(TokenService tokenService) {
        this.tokenService = tokenService;
    }

    @GetMapping("/login")
    public TokenResponse login() {
        return tokenService.issueToken();
    }

    @GetMapping("/refresh")
    public TokenResponse refresh(@RequestParam String refreshToken) {
        if (!tokenService.isRefreshTokenExpired(refreshToken)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "유효하지 않은 RefreshToken입니다.");
        }
        return tokenService.issueToken();
    }
}
