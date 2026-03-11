package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 * Integration Test for App
 * These tests run during the VERIFY phase (maven-failsafe-plugin)
 */
public class AppIT {

    @Test
    public void testApplicationIntegration() {
        // Integration test: verify the application can be instantiated
        App app = new App();
        assertNotNull("App instance should not be null", app);
    }

    @Test
    public void testMainMethodExecution() {
        // Integration test: verify main method can run without exceptions
        try {
            App.main(new String[]{});
            // If no exception is thrown, test passes
            assertTrue("Main method executed successfully", true);
        } catch (Exception e) {
            fail("Main method should not throw exception: " + e.getMessage());
        }
    }
}
