package proj21_movie.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({ContextDataSource.class, ContextSqlSession.class, MvcConfig.class})
@ComponentScan(basePackages = {
		 "proj21_movie.mapper",  "proj21_movie.controller"
		 , "proj21_movie.service", "proj21_movie.common"  })
public class ContextRoot {

}
