/**
 * 
 */
package com.ankit.portal.exception;

/**
 * @author Ankit
 *
 */
public class PermissionLacks extends Exception {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    public PermissionLacks() {
        this("Lack of permissions fot this operation");
    }

    /**
     * @param message
     */
    public PermissionLacks(String message) {
        super(message);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param cause
     */
    public PermissionLacks(Throwable cause) {
        super(cause);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param message
     * @param cause
     */
    public PermissionLacks(String message, Throwable cause) {
        super(message, cause);
        // TODO Auto-generated constructor stub
    }

}
