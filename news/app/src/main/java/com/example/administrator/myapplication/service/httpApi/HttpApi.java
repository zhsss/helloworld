package com.example.administrator.myapplication.service.httpApi;

import com.example.administrator.myapplication.vo.response.news.ListNewsVO;

import io.reactivex.Observable;
import retrofit2.http.POST;
import retrofit2.http.Query;

/**
 * Created by Administrator on 2017/11/25 0025.
 */

public interface HttpApi {
    @POST("toutiao/index")
    Observable<ListNewsVO> newsList(@Query("type") String type, @Query("key") String key);
}
