<?php declare(strict_types=1);

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static OptionOne()
 * @method static static OptionTwo()
 * @method static static OptionThree()
 */
final class StatusRole extends Enum
{
    const SAP_DIEN_RA = 0;
    const DANG_DIEN_RA = 1;
    const HET_DIEN_RA = 2;
}
