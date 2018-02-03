package com.ankit.portal.service.dao;

import com.ankit.portal.service.domain.Reference;

public interface ReferenceDAO {

    Reference addReference(Reference reference);

    Reference updateReference(Reference reference);
}
