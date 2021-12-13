package org.zerock.config;

import javax.servlet.Filter;
import javax.servlet.ServletRegistration;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {


	@Override // override했다고 컴파일 시점에 안정적으로 알려주기 위해서
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { RootConfig.class, SecurityConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { ServletConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	protected void customizeRegistration(
			ServletRegistration.Dynamic registration) {

		registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");

	}
	
	@Override
	  protected Filter[] getServletFilters() {
	    CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
	      characterEncodingFilter.setEncoding("UTF-8");
	      characterEncodingFilter.setForceEncoding(true);

	      return new Filter[] { characterEncodingFilter };
	  }

}


