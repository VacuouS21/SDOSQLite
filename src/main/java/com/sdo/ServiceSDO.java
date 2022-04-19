package com.sdo;

import ru.ep.sdo.Session;

public interface ServiceSDO {
    public Session createProperties();
    public void getAll();
    public void renameObject(String oldName,String newName);
}
