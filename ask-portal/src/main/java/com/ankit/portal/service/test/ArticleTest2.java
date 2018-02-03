package com.ankit.portal.service.test;

import com.ankit.portal.service.util.ArticleUtil;
import com.ankit.portal.support.StatusType;

public class ArticleTest2 {

    public static void main(String[] args) {
        System.out.println("Got->"+ArticleUtil.getLatestVersionArticleByUUIDStatus("898e3147-046d-4126-adf2-3f19d4b4a88f", StatusType.PUBLISHED).getArticleId());
    }
}
