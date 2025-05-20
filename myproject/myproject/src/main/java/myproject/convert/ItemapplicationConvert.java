package myproject.convert;

import myproject.entity.ItemapplicationEntity;
import myproject.vo.ItemapplicationVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
* 用品申领
*
*/
@Mapper
public interface ItemapplicationConvert {
    ItemapplicationConvert INSTANCE = Mappers.getMapper(ItemapplicationConvert.class);

    ItemapplicationEntity convert(ItemapplicationVO vo);

    ItemapplicationVO convert(ItemapplicationEntity entity);

    List<ItemapplicationVO> convertList(List<ItemapplicationEntity> list);

    List<ItemapplicationEntity> convertEntityList(List<ItemapplicationVO> list);
}