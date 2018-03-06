package com.xh.mybatis.shiro.commons.cache;

import java.util.Collection;
import java.util.Collections;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.shiro.cache.CacheException;
import org.springframework.cache.Cache;
import org.springframework.cache.Cache.ValueWrapper;

/**
 * 
 * <p>Title: 使用spring-cache作为shiro缓存</p>
 * <p>Description: </p>
 * 
 * @author H.Yang
 * @date 2018年3月6日
 * 
 * @param <K>
 * @param <V>
 */
public class ShiroSpringCache<K, V> implements org.apache.shiro.cache.Cache<K, V> {
	private static final Logger LOGGER = LogManager.getLogger(ShiroSpringCache.class);

	private final org.springframework.cache.Cache cache;

	public ShiroSpringCache(Cache cache) {
		if (cache == null) {
			throw new IllegalArgumentException("Cache argument cannot be null.");
		}
		this.cache = cache;
	}

	public V get(K key) throws CacheException {
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("Getting object from cache [" + this.cache.getName() + "] for key [" + key + "]key type:" + key.getClass());
		}
		ValueWrapper valueWrapper = cache.get(key);
		if (valueWrapper == null) {
			if (LOGGER.isTraceEnabled()) {
				LOGGER.trace("Element for [" + key + "] is null.");
			}
			return null;
		}
		return (V) valueWrapper.get();
	}

	public V put(K key, V value) throws CacheException {
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("Putting object in cache [" + this.cache.getName() + "] for key [" + key + "]key type:" + key.getClass());
		}
		V previous = get(key);
		cache.put(key, value);
		return previous;
	}

	public V remove(K key) throws CacheException {
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("Removing object from cache [" + this.cache.getName() + "] for key [" + key + "]key type:" + key.getClass());
		}
		V previous = get(key);
		cache.evict(key);
		return previous;
	}

	public void clear() throws CacheException {
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("Clearing all objects from cache [" + this.cache.getName() + "]");
		}
		cache.clear();
	}

	public int size() {
		return 0;
	}

	public Set<K> keys() {
		return Collections.emptySet();
	}

	public Collection<V> values() {
		return Collections.emptySet();
	}

	@Override
	public String toString() {
		return "ShiroSpringCache [" + this.cache.getName() + "]";
	}

}
