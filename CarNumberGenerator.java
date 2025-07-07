package com.example.parking.util;

import java.util.Random;

public class CarNumberGenerator {
    private static final String[] KOREAN_CHARS = {
        "가", "나", "다", "라", "마", "거", "너", "더", "러", "머",
        "버", "서", "어", "저", "고", "노", "도", "로", "모", "보",
        "소", "오", "조", "구", "누", "두", "루", "무", "부", "수",
        "우", "주", "아", "바", "사", "자", "배", "허", "하", "호"
    };

    public static String generate() {
        Random rand = new Random();
        int firstNumber = rand.nextInt(90) + 10;   // 10 ~ 99
        String koreanChar = KOREAN_CHARS[rand.nextInt(KOREAN_CHARS.length)];
        int lastNumber = rand.nextInt(9000) + 1000; // 1000 ~ 9999
        return firstNumber + koreanChar + lastNumber;
    }
}

