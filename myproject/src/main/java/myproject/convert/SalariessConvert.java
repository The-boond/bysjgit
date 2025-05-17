package myproject.convert;

import myproject.entity.SalariessEntity;
import myproject.vo.SalariessVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
* 薪资
*
*/
@Mapper
public interface SalariessConvert {
    SalariessConvert INSTANCE = Mappers.getMapper(SalariessConvert.class);

    SalariessEntity convert(SalariessVO vo);

    SalariessVO convert(SalariessEntity entity);

    List<SalariessVO> convertList(List<SalariessEntity> list);

    List<SalariessEntity> convertEntityList(List<SalariessVO> list);
}