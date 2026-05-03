package com.example.httptest.httpmethodtest.Service;

import com.example.httptest.httpmethodtest.DTO.TokenResponse;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class TokenService {
    private final String staticRefreshToken = "umc_refresh_token";

    private final long accessTokenValidDuration = 60 * 1000;

    private final Map<String, Long> accessTokenMap = new HashMap<>();

    public String getStaticRefreshToken() {
        String accessToken = UUID.randomUUID().toString();
        accessTokenMap.put(accessToken, System.currentTimeMillis() + accessTokenValidDuration);
        return accessToken;
    }

    public boolean isAccessTokenExpired(String token) {
        Long expiryTime = accessTokenMap.get(token);
        return expiryTime != null && expiryTime > System.currentTimeMillis();
    }

    public boolean isRefreshTokenExpired(String refreshToken) {
        return staticRefreshToken.equals(refreshToken);
    }

    public TokenResponse issueToken() {
        String newAccessToken = getStaticRefreshToken();
        return new TokenResponse(newAccessToken, staticRefreshToken);
    }
}
