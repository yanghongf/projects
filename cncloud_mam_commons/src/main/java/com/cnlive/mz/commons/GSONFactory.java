package com.cnlive.mz.commons;

import com.google.gson.Gson;

public class GSONFactory {

	private static Gson gson;

	private GSONFactory() {
	}

	public static synchronized Gson getInstance() {
		if (gson != null) {
			return gson;
		} else {
			gson = new Gson();
			return gson;
		}
	}

}
