package thuc.ute.admin_crud.configs;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter {


    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addDecoratorPath("/*", "web.jsp")
                .addDecoratorPath("/admin/*", "admin.jsp")
                .addExcludedPath("/login*")
                .addExcludedPath("/login/*")
                .addExcludedPath("/alogin*")
                .addExcludedPath("/alogin/*")
                .addExcludedPath("/api/**");
    }
}