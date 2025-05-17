package myproject.convert;

import myproject.entity.LeavessEntity;
import myproject.vo.LeavessVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
* 请假
*
*/
@Mapper
public interface LeavessConvert {
    LeavessConvert INSTANCE = Mappers.getMapper(LeavessConvert.class);

    LeavessEntity convert(LeavessVO vo);

    LeavessVO convert(LeavessEntity entity);

    List<LeavessVO> convertList(List<LeavessEntity> list);

    List<LeavessEntity> convertEntityList(List<LeavessVO> list);
}