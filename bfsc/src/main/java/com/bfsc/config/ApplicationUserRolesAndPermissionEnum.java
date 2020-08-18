package com.bfsc.config;

import java.util.Set;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.google.common.collect.Sets;

public enum ApplicationUserRolesAndPermissionEnum {

	ADMIN(Sets.newHashSet(PermissionEnum.READ.name(), PermissionEnum.WRITE.name())),

	USER(Sets.newHashSet(PermissionEnum.READ.name()));

	private final Set<String> permission;

	ApplicationUserRolesAndPermissionEnum(Set<String> permission) {

		this.permission = permission;

	}

	private Set<String> getPermissions() {
		return this.permission;
	}

	public Set<SimpleGrantedAuthority> getUserGrantedAuthority() {
		Set<SimpleGrantedAuthority> grantedAuthority = getPermissions().stream()
				.map(permission -> new SimpleGrantedAuthority(permission)).collect(Collectors.toSet());
		grantedAuthority.add(new SimpleGrantedAuthority("ROLE_" + this.name()));

		return grantedAuthority;
	}

}
