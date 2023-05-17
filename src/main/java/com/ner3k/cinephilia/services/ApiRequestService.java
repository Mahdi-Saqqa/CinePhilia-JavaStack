package com.ner3k.cinephilia.services;

import org.springframework.web.client.RestTemplate;

public class ApiRequestService {


    public static String getMovie(String id)
    {
        final String uri = "https://api.themoviedb.org/3/movie/"+id +"?api_key=936ec287a61d8548efeb41653e17f492";

        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(uri, String.class);

        System.out.println(result);

        return  result;
    }
}
